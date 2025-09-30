package com.quadrant.travelshoot.shared.exception;

public class CustomExceptions {
    
    public static class UserNotFoundException extends RuntimeException {
        public UserNotFoundException(String message) {
            super(message);
        }
    }
    
    public static class SurveyAlreadyCompletedException extends RuntimeException {
        public SurveyAlreadyCompletedException(String message) {
            super(message);
        }
    }
    
    public static class SurveyNotFoundException extends RuntimeException {
        public SurveyNotFoundException(String message) {
            super(message);
        }
    }
}