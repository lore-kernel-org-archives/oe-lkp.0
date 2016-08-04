Content-Type: multipart/mixed; boundary="===============5195419279222569629=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [f2fs] ec795418c4: fsmark.files_per_sec -36.3% regression
Date: Thu, 04 Aug 2016 13:36:13 -0700
Message-ID: <87r3a4b7b6.fsf@yhuang-mobile.sh.intel.com>
In-Reply-To: <20160804185251.GA13813@jaegeuk>
List-Id: <oe-lkp.lists.linux.dev>

--===============5195419279222569629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Jaegeuk Kim <jaegeuk@kernel.org> writes:

> On Thu, Aug 04, 2016 at 10:44:20AM -0700, Huang, Ying wrote:
>> Jaegeuk Kim <jaegeuk@kernel.org> writes:
>> =

>> > Hi Huang,
>> >
>> > On Thu, Aug 04, 2016 at 10:00:41AM -0700, Huang, Ying wrote:
>> >> Hi, Jaegeuk,
>> >> =

>> >> "Huang, Ying" <ying.huang@intel.com> writes:
>> >> > Hi,
>> >> >
>> >> > I checked the comparison result below and found this is a regressio=
n for
>> >> > fsmark.files_per_sec, not fsmark.app_overhead.
>> >> >
>> >> > Best Regards,
>> >> > Huang, Ying
>> >> >
>> >> > kernel test robot <xiaolong.ye@intel.com> writes:
>> >> >
>> >> >> FYI, we noticed a -36.3% regression of fsmark.files_per_sec due to=
 commit:
>> >> >>
>> >> >> commit ec795418c41850056feb956534edf059dc1155d4 ("f2fs: use percpu=
_rw_semaphore")
>> >> >> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git d=
ev-test
>> >> =

>> >> I found this has been merged by upstream.  Do you have some plan to f=
ix
>> >> it?  Or you think the test itself has some problem?
>> >
>> > Sorry, too busy to take a look at this.
>> > The patch implements percpu_rw_semaphore which is intended to enhance =
FS
>> > scalability. Since I couldn't see any big regression in my test cases,=
 could you
>> > check any debugging options which may give some overheads?
>> =

>> The kernel config related with F2FS is as follow in our test,
>> =

>> CONFIG_F2FS_FS=3Dm
>> CONFIG_F2FS_STAT_FS=3Dy
>> CONFIG_F2FS_FS_XATTR=3Dy
>> CONFIG_F2FS_FS_POSIX_ACL=3Dy
>> # CONFIG_F2FS_FS_SECURITY is not set
>> # CONFIG_F2FS_CHECK_FS is not set
>> # CONFIG_F2FS_FS_ENCRYPTION is not set
>> # CONFIG_F2FS_IO_TRACE is not set
>> # CONFIG_F2FS_FAULT_INJECTION is not set
>> =

>> What do you think we need to change?  Or do you mean some other
>> debugging options?  Anyway, you can check our kernel config attached.
>> =

>> > Let me recheck this with whole my tests.
>> =

>> Maybe you can try our kernel config?  Or if our kernel config is not
>> reasonable, can you help us to revise it?  The full kernel config we
>> used is attached with the email.
>
> I could reproduce the fsmark regression in my machine and confirm there is
> another small regression as well.
> I'll revert this patch. Thank you.
>
> [lkp] [f2fs] 3bdad3c7ee: aim7.jobs-per-min -25.3% regression
> [lkp] [f2fs] b93f771286: aim7.jobs-per-min -81.2% regression
>
> In terms of the above regression, I could check that _reproduce_ procedure
> includes mounting filesystem only. Is that correct?

Sorry, our test system failed to generate reproduce steps for aim7.  We
will implement it.

- [lkp] [f2fs] 3bdad3c7ee: aim7.jobs-per-min -25.3% regression

The disk is one 48G ram disk.  The steps for aim7 is,

cat > workfile <<EOF
FILESIZE: 1M
POOLSIZE: 10M
10 disk_cp
EOF

(
	echo $HOSTNAME
	echo disk_cp

	echo 1
	echo 3000
	echo 2
	echo 3000
	echo 1
) | ./multitask -t &


- [lkp] [f2fs] b93f771286: aim7.jobs-per-min -81.2% regression

The disk is 4 12G ram disk, and setup RAID0 on them via mdadm.  The
steps for aim7 is,

cat > workfile <<EOF
FILESIZE: 1M
POOLSIZE: 10M
10 sync_disk_rw
EOF

(
	echo $HOSTNAME
	echo sync_disk_rw

	echo 1
	echo 600
	echo 2
	echo 600
	echo 1
) | ./multitask -t &


Best Regards,
Huang, Ying

--===============5195419279222569629==--

