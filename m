Content-Type: multipart/mixed; boundary="===============1463944382196034511=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [f2fs] ec795418c4: fsmark.files_per_sec -36.3% regression
Date: Sat, 27 Aug 2016 10:13:34 +0800
Message-ID: <20160827021334.eb3xpz57xvo37g5l@wfg-t540p.sh.intel.com>
In-Reply-To: <20160827005257.GD88444@jaegeuk>
List-Id: <oe-lkp.lists.linux.dev>

--===============1463944382196034511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jaegeuk,

>> >> > - [lkp] [f2fs] b93f771286: aim7.jobs-per-min -81.2% regression
>> >> >
>> >> > The disk is 4 12G ram disk, and setup RAID0 on them via mdadm.  The
>> >> > steps for aim7 is,
>> >> >
>> >> > cat > workfile <<EOF
>> >> > FILESIZE: 1M
>> >> > POOLSIZE: 10M
>> >> > 10 sync_disk_rw
>> >> > EOF
>> >> >
>> >> > (
>> >> >     echo $HOSTNAME
>> >> >     echo sync_disk_rw
>> >> >
>> >> >     echo 1
>> >> >     echo 600
>> >> >     echo 2
>> >> >     echo 600
>> >> >     echo 1
>> >> > ) | ./multitask -t &
>> >>
>> >> Any update on these 2 regressions?  Is the information is enough for =
you
>> >> to reproduce?
>> >
>> > Sorry, I've had no time to dig this due to business travel now.
>> > I'll check that when back to US.
>>
>> Any update?
>
>Sorry, how can I get multitask binary?

It's part of aim7, which can be downloaded here:

http://nchc.dl.sourceforge.net/project/aimbench/aim-suite7/Initial%20releas=
e/s7110.tar.Z

Thanks,
Fengguang

--===============1463944382196034511==--

