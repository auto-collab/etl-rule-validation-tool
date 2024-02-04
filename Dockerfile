# Use an official Python runtime as the base image
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Download and install Python
RUN powershell -Command "Invoke-WebRequest -Uri 'https://www.python.org/ftp/python/3.9.0/python-3.9.0-amd64.exe' -OutFile 'C:\python-3.9.0-amd64.exe' ; Start-Process C:\python-3.9.0-amd64.exe -ArgumentList '/quiet TargetDir=C:\Python InstallAllUsers=1' -Wait ; Remove-Item C:\python-3.9.0-amd64.exe"

# Download the Visual C++ 2017 Redistributable
RUN powershell -Command "Invoke-WebRequest -Uri 'https://aka.ms/vs/15/release/vc_redist.x64.exe' -OutFile 'C:\vc_redist.x64.exe'"

# Install the Visual C++ 2017 Redistributable
RUN C:\vc_redist.x64.exe /install /quiet /norestart

# Set the PATH environment variable to include the Python installation directory
ENV PATH="C:\Windows\System32;C:\Windows\System32\WindowsPowerShell\v1.0;C:\Python\Python39;C:\Python\Python39\Scripts;C:\Python;C:\Python\Scripts;C:\Windows\System32;%PATH%"

# Download and install Microsoft ODBC Driver 17 for SQL Server
RUN powershell -Command "Invoke-WebRequest -Uri 'https://go.microsoft.com/fwlink/?linkid=2249006' -OutFile 'C:\msodbcsql.msi'; Start-Process -Wait msiexec.exe -ArgumentList '/i', 'C:\msodbcsql.msi', '/quiet', '/norestart', 'IACCEPTMSODBCSQLLICENSETERMS=YES', 'ADDLOCAL=ALL';"

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies specified in requirements.txt
RUN python -m pip install --no-cache-dir -r requirements.txt

# Define the command to run the application
CMD ["python", "main.py"]

