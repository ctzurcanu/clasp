//! Stream representation for Common Lisp streams

use crate::header::{TypeHeader, ObjectType};
use crate::object::LispObject;
use std::io::{Read, Write, BufReader, BufWriter};
use std::fs::File;

/// Stream direction
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum StreamDirection {
    Input,
    Output,
    InputOutput,
}

/// Stream element type
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum StreamElementType {
    Character,
    Byte,
}

/// Internal stream data
pub enum StreamData {
    /// Standard input
    Stdin,
    /// Standard output
    Stdout,
    /// Standard error
    Stderr,
    /// File input stream
    FileInput(BufReader<File>),
    /// File output stream
    FileOutput(BufWriter<File>),
    /// String input stream
    StringInput { content: String, position: usize },
    /// String output stream
    StringOutput { buffer: String },
    /// Closed stream
    Closed,
}

/// A stream for I/O operations
#[repr(C)]
pub struct Stream {
    pub header: TypeHeader,
    /// Direction of the stream
    pub direction: StreamDirection,
    /// Element type
    pub element_type: StreamElementType,
    /// Stream data (boxed for flexibility)
    pub data: Box<StreamData>,
}

impl Stream {
    /// Create a new stream
    pub fn new(direction: StreamDirection, element_type: StreamElementType, data: StreamData) -> Self {
        Stream {
            header: TypeHeader::new(ObjectType::Stream),
            direction,
            element_type,
            data: Box::new(data),
        }
    }

    /// Create stdin stream
    pub fn stdin() -> Self {
        Stream::new(StreamDirection::Input, StreamElementType::Character, StreamData::Stdin)
    }

    /// Create stdout stream
    pub fn stdout() -> Self {
        Stream::new(StreamDirection::Output, StreamElementType::Character, StreamData::Stdout)
    }

    /// Create stderr stream
    pub fn stderr() -> Self {
        Stream::new(StreamDirection::Output, StreamElementType::Character, StreamData::Stderr)
    }

    /// Check if stream is open
    pub fn is_open(&self) -> bool {
        !matches!(*self.data, StreamData::Closed)
    }

    /// Check if stream is an input stream
    pub fn is_input(&self) -> bool {
        matches!(self.direction, StreamDirection::Input | StreamDirection::InputOutput)
    }

    /// Check if stream is an output stream
    pub fn is_output(&self) -> bool {
        matches!(self.direction, StreamDirection::Output | StreamDirection::InputOutput)
    }
}

impl LispObject {
    /// Check if this object is a stream
    pub fn is_stream(self) -> bool {
        use crate::header::TypeHeader;
        if let Some(ptr) = self.as_general_ptr::<Stream>() {
            if ptr.is_null() {
                return false;
            }
            unsafe {
                TypeHeader::from_ptr(ptr) == Some(ObjectType::Stream)
            }
        } else {
            false
        }
    }

    /// Get as stream pointer if this is a stream
    pub fn as_stream_ptr(self) -> Option<*const Stream> {
        if self.is_stream() {
            self.as_general_ptr::<Stream>()
        } else {
            None
        }
    }
}
