
# 📊 EMR Schema Extension for Medical Image Storage

This project expands the existing Electronic Medical Record (EMR) schema to accommodate generated medical image data and their associated metadata using a relational database model.

---

## 📌 Objective

- Extend the EMR schema to support image records.
- Link images to patient records.
- Allow flexible, extensible metadata storage via key-value pairs.

---

## 📂 Database Tables

### 1️⃣ Patients Table

```sql
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    PatientName VARCHAR(100),
    DateOfBirth DATE
);
```

**Sample Data:**

```sql
INSERT INTO Patients (PatientName, DateOfBirth)
VALUES 
    ('John Doe', '1980-05-10'),
    ('Mary Smith', '1992-11-23');
```

---

### 2️⃣ Images Table

```sql
CREATE TABLE Images (
    ImageID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT NOT NULL,
    ImagePath VARCHAR(255) NOT NULL,
    ImageType VARCHAR(50),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);
```

**Sample Data:**

```sql
INSERT INTO Images (PatientID, ImagePath, ImageType)
VALUES 
    (1, '/images/john_ct_scan.png', 'CT Scan'),
    (2, '/images/mary_mri.jpg', 'MRI');
```

---

### 3️⃣ ImageMetadata Table

```sql
CREATE TABLE ImageMetadata (
    MetadataID INT PRIMARY KEY AUTO_INCREMENT,
    ImageID INT NOT NULL,
    MetaKey VARCHAR(100) NOT NULL,
    MetaValue VARCHAR(255),
    FOREIGN KEY (ImageID) REFERENCES Images(ImageID)
);
```

**Sample Data:**

```sql
INSERT INTO ImageMetadata (ImageID, MetaKey, MetaValue)
VALUES
    (1, 'Resolution', '1024x768'),
    (1, 'ScanDate', '2025-07-01'),
    (1, 'Radiologist', 'Dr. Abraham Mathew'),
    (2, 'Resolution', '2048x2048'),
    (2, 'ScanDate', '2025-07-03'),
    (2, 'Radiologist', 'Dr. Priya Nair');
```

---

## 📈 Example Query

Fetch all images and associated metadata for a specific patient:

```sql
SELECT p.PatientName, i.ImagePath, i.ImageType, m.MetaKey, m.MetaValue
FROM Patients p
JOIN Images i ON p.PatientID = i.PatientID
LEFT JOIN ImageMetadata m ON i.ImageID = m.ImageID
WHERE p.PatientName = 'John Doe';
```

---

## 📊 Key Features

- Relational database model using SQL.
- Extensible metadata storage via key-value pairs.
- Logical association between patients, images, and metadata.
- Foreign key constraints for data integrity.
- Example data and queries included.

---

## 📜 License

MIT License

---

## 📬 Contact

For any queries or contributions, feel free to raise an issue or fork the repository.
