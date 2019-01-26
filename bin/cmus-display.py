import subprocess

def minute(timeStr):
        minute = int(timeStr) / 60
        second = int(timeStr) % 60
        return "%02d:%02d" % (minute, second)

if __name__ == "__main__":
        process = subprocess.Popen(("cmus-remote","-Q"), stdout=subprocess.PIPE,stderr=subprocess.PIPE)
        strList = process.stdout.read().decode().split('\n')
        try:
                fileName = strList[1][26:-4]
                delimiter = fileName.index('-')
                title = fileName[:delimiter-1]
                artist = fileName[delimiter+2:]
                duration = strList[2][9:]
                position = strList[3][9:]
                duration = minute(duration)
                position = minute(position)
                print("%s - %s [%s/%s]" % (title, artist, position, duration))
        except:
                print("No music playing!")
