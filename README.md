# Ultra-Deep PC Cleaner (Batch Script)

A powerful, lightweight, and fully automated Windows optimization and cleanup script written in Batch. It purges system junk, temporary files, browser caches, and obsolete Windows Update backups to reclaim gigabytes of disk space.

---

## Features

This script goes far beyond basic temp file deletion by targeting advanced system directories:

*   **System & User Temp Files:** Safely deletes `.tmp`, log files, and cache.
*   **Recycle Bin:** Empties the Recycle Bin for all system drives.
*   **Windows Update Cache:** Stops the Update service to safely purge old installation files, then restarts it.
*   **WinSxS Cleanup (DISM):** Performs an advanced deep clean of the Windows Component Store to remove obsolete system components.
*   **Crash & Error Reports:** Deletes accumulated Windows Error Reporting (WER) logs.
*   **Browser Cache Purge:** Clears temporary cached files for Google Chrome, Microsoft Edge, and Mozilla Firefox.
*   **DNS Flush:** Clears the network cache to resolve connectivity hiccups.
*   **Space Savings Calculator:** Dynamically measures and displays the exact amount of disk space (in MB) saved during the run.

---

## Prerequisites

*   **Operating System:** Windows 10 or Windows 11.
*   **Permissions:** **Administrator privileges** are strictly required (the script will alert you if run without them).

---

## How to Use

1.  **Download** the `nettoyeur.bat` file (or copy the code into a plain text file and save it as `cleaner.bat`).
2.  Right-click on the file and select **Run as administrator**.
3.  Let the script run. *Note: The WinSxS cleanup phase might look frozen for a moment; this is normal and means it is doing the heavy lifting.*
4.  Once finished, the script will show you a success message along with the total space reclaimed.

---

## Always Run as Administrator (Optional Setup)

If you plan to use this tool frequently, you can configure a shortcut to always open it as an Administrator:

1.  Right-click `nettoyeur.bat` and select **Send to** > **Desktop (create shortcut)**.
2.  Go to your Desktop, right-click the new shortcut, and choose **Properties**.
3.  Under the *Shortcut* tab, click the **Advanced...** button.
4.  Check the box for **Run as administrator**, then click **OK** and **Apply**.

---

## License

This project is open-source. Feel free to fork, modify, and improve it!
