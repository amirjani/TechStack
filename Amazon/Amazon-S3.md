# Amazon S3

Amazon S3 → Simple Storage Service 

Software Characteristic
- Scalability 
- Data Availability 
- Security 
- Performance

## How It Works 
![aws-image](https://d1.awsstatic.com/s3-pdp-redesign/product-page-diagram_Amazon-S3_HIW.cf4c2bd7aa02f1fe77be8aa120393993e08ac86d.png)

as we see in the above image, our application may have below parts: 
1. Analytical Data
2. Log Files 
3. Application Data
4. Videos And Pictures 
5. Backup And Archival 

**Pro's**: 
- Control Access To The Data  → Permissions 
- Optimize Cost  → Pay As You Go
- Replication  → Any Region with at least three backups 
- Accessibility  → fast
- Protection And Security  
- Gain Visibility 
- Backups → Recovery Time Objectives(RTO) & Recovery Point Objective(RPO)
- Data Lake


## Data Lake
> Major Reason For Create Data Lakes Are: 1. Break Down Data Silos, 2. Having Pockets of data in different places, Controlled by different groups 

![DataLakes](https://d1.awsstatic.com/Data%20Lakes%20Storage%20Infrastructure/Data-Lake-Storage-Infrastructure.aa068b26fd43e26640fd3d700bc3061a8748fdaa.png)

# Main Methods 

> Multipart upload allows you to upload a single object as a set of parts. Each part is a contiguous portion of the object's data. You can upload these object parts independently and in any order.

| Method | Description | Necessity
| ------------- | ------------- | ------------- |
| AbortMultipartUpload | After a multipart upload is aborted, no additional parts can be uploaded using that upload ID  | ✕
| CompleteMultipartUpload  | Completes a multipart upload by assembling previously uploaded parts  | ✕
| CopyObject | Creates a copy of an object that is already stored in Amazon S3. | ✔︎
| CreateBucket | you must register with Amazon S3 and have a valid AWS Access Key ID to authenticate requests | ✔︎
| CreateMultipartUpload | This action initiates a multipart upload and returns an upload ID | ✕
| DeleteBucket | Deletes the S3 bucket | ✔︎
| DeleteBucketCors | Deletes the cors configuration information set for the bucket | ✕
| DeleteObject | Removes the null version (if there is one) of an object and inserts a delete marker, which becomes the latest version of the object. | ✔︎
| DeleteObjects | This action enables you to delete multiple objects from a bucket using a single HTTP request. | ✔︎
| GetBucketCors | Returns the cors configuration information set for the bucket. | ✕
| GetObject | Retrieves objects from Amazon S3. | ✔︎
| HeadObject | The HEAD action retrieves metadata from an object without returning the object itself. | ✕
| ListBuckets | Returns a list of all buckets owned by the authenticated sender of the request. | ✔︎
| ListMultipartUploads | This action lists in-progress multipart uploads. | ✕
| ListObjects | Returns some or all (up to 1,000) of the objects in a bucket. | ✔︎
| ListParts | Lists the parts that have been uploaded for a specific multipart upload. | ✕
| PutBucketCors | Sets the cors configuration for your bucket. | ✕
| PutObject | Adds an object to a bucket. | ✔︎
| RestoreObject | Restores an archived copy of an object back into Amazon S3. | ✔︎
| UploadPart | Uploads a part in a multipart upload. | ✔︎

## Notes
upload and multipart upload perform the same action but there are the few advantage of multipart upload

- You can upload parts in parallel to improve throughput.
- Smaller part size minimizes the impact of restarting a failed upload due to a network error.
- You can upload object parts over time. Once you initiate a multipart upload
- there is no expiry; you must explicitly complete or abort the multipart upload.
- You can upload an object as you are creating it.

So you can decide which one you should go with according to your need , multipart is recommended when the object you are uploading is big in size .

