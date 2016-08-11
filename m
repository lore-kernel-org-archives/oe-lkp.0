Content-Type: multipart/mixed; boundary="===============8066684338256055051=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [f2fs] ec795418c4: fsmark.files_per_sec -36.3% regression
Date: Thu, 11 Aug 2016 15:49:41 -0700
Message-ID: <87vaz6yl8a.fsf@yhuang-mobile.sh.intel.com>
In-Reply-To: <87r3a4b7b6.fsf@yhuang-mobile.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8066684338256055051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Kim,

"Huang, Ying" <ying.huang@intel.com> writes:
>>
>> [lkp] [f2fs] 3bdad3c7ee: aim7.jobs-per-min -25.3% regression
>> [lkp] [f2fs] b93f771286: aim7.jobs-per-min -81.2% regression
>>
>> In terms of the above regression, I could check that _reproduce_ procedu=
re
>> includes mounting filesystem only. Is that correct?
>
> Sorry, our test system failed to generate reproduce steps for aim7.  We
> will implement it.
>
> - [lkp] [f2fs] 3bdad3c7ee: aim7.jobs-per-min -25.3% regression
>
> The disk is one 48G ram disk.  The steps for aim7 is,
>
> cat > workfile <<EOF
> FILESIZE: 1M
> POOLSIZE: 10M
> 10 disk_cp
> EOF
>
> (
> 	echo $HOSTNAME
> 	echo disk_cp
>
> 	echo 1
> 	echo 3000
> 	echo 2
> 	echo 3000
> 	echo 1
> ) | ./multitask -t &
>
>
> - [lkp] [f2fs] b93f771286: aim7.jobs-per-min -81.2% regression
>
> The disk is 4 12G ram disk, and setup RAID0 on them via mdadm.  The
> steps for aim7 is,
>
> cat > workfile <<EOF
> FILESIZE: 1M
> POOLSIZE: 10M
> 10 sync_disk_rw
> EOF
>
> (
> 	echo $HOSTNAME
> 	echo sync_disk_rw
>
> 	echo 1
> 	echo 600
> 	echo 2
> 	echo 600
> 	echo 1
> ) | ./multitask -t &

Any update on these 2 regressions?  Is the information is enough for you
to reproduce?

Best Regards,
Huang, Ying

--===============8066684338256055051==--

