Content-Type: multipart/mixed; boundary="===============7740109931819818505=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [ses] 3417c1b5cb: WARNING: CPU: 2 PID: 2013 at fs/xfs/xfs_file.c:772 xfs_file_dio_aio_write+0x2a2/0x320()
Date: Mon, 28 Dec 2015 16:04:34 +0800
Message-ID: <87bn9b0zjh.fsf@yhuang-dev.intel.com>
In-Reply-To: <1451279958.2283.4.camel@HansenPartnership.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7740109931819818505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

James Bottomley <James.Bottomley@HansenPartnership.com> writes:

> [cc to linux-scsi added]
> On Mon, 2015-12-28 at 09:43 +0800, kernel test robot wrote:
>> FYI, we noticed the below changes on
>> =

>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ma
>> ster
>> commit 3417c1b5cb1fdc10261dbed42b05cc93166a78fd ("ses: Fix problems
>> with simple enclosures")
>> =

>> This may be the intended behavior, we found after your commit, the
>> following new message appears in kernel log:
>> =

>> [   40.804515] scsi 8:0:12:0: Wrong diagnostic page; asked for 7 got
>> 0
>> =

>> To reproduce:
>> =

>>         git clone
>> git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
>>         cd lkp-tests
>>         bin/lkp install job.yaml  # job file is attached in this
>> email
>>         bin/lkp run     job.yaml
>
> OK, so what is the enclosure device at host 8?  And what happens when
> you use sg_ses to ask for page 7?

We run xfstests on the test machine.  You can check the dmesg (kmsg.xz)
attached in the original reporting email for information about scsi host
8.

Best Regards,
Huang, Ying

--===============7740109931819818505==--

