CREATE TABLE ImageMetadata (
    MetadataID INT PRIMARY KEY AUTO_INCREMENT,
    ImageID INT NOT NULL,
    MetadataKey VARCHAR(100) NOT NULL,
    MetadataValue VARCHAR(255) NOT NULL,
    FOREIGN KEY (ImageID) REFERENCES Images(ImageID) ON DELETE CASCADE,
    UNIQUE (ImageID, MetadataKey) -- Ensures that each key is unique for a given image
);