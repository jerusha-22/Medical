CREATE TABLE Images (
    ImageID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT NOT NULL,
    ImageURL VARCHAR(255) NOT NULL, -- URL or path to the image file
    Modality ENUM('CT', 'MRI', 'X-ray', 'Ultrasound', 'Other') NOT NULL,
    DateCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Description TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) ON DELETE CASCADE
);