# Description
## Craete a Shell script that automates checking disk storage usage and sends an email alert if uasge exceeds a specified threshold

### Step 1: Install msmtp Package
```
sudo apt update
sudo apt-get install msmtp -y
```


### Step 2: onfigure ~/.msmtp file

<img src="./screenshots/Screenshot from 2024-06-24 04-52-54.png" width="1000" >

#### Make sure to secure the .msmtprc file so only you can read it:
```
chmod 600 ~/.msmtprc
```

#### You can create app password using the Steps on this link:

[Create App Password](https://arnaudr.io/2020/08/24/send-emails-from-your-terminal-with-msmtp/)

### Step 2: Create lab2-script.sh file

<img src="./screenshots/Screenshot from 2024-06-24 05-43-48.png" width="1000" >

#### Make the Script Executable
```
chmod +x lab2.sh
```

### Step 3: Create Tmp file to store the disk usage report

#### go to ./lab2-log.log

<img src="./screenshots/Screenshot from 2024-06-24 05-46-00.png" width="1000" >

### Step 4: Schedule with Cron 
```
0 * * * * /lab2/lab2.sh
```

### Step 5: Run the Script 

<img src="./screenshots/Screenshot from 2024-06-24 05-48-31.png" width="1000" >

<img src="./screenshots/Screenshot from 2024-06-24 05-49-38.png" width="1000" >

### Step 6: Check your Mail

<img src="./screenshots/Screenshot from 2024-06-24 05-50-35.png" width="1000" >