Content-Type: multipart/mixed; boundary="===============1239319111005413673=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [floppy] 09954bad44: kmsg.blk_update_request:I/O_error, dev_fd#, sector
Date: Mon, 15 Feb 2016 08:34:32 +0800
Message-ID: <87egcehkvb.fsf@yhuang-dev.intel.com>
In-Reply-To: <alpine.LNX.2.00.1602150001150.22727@cbobk.fhfr.pm>
List-Id: <oe-lkp.lists.linux.dev>

--===============1239319111005413673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Jiri Kosina <jkosina@suse.cz> writes:

> On Sun, 14 Feb 2016, kernel test robot wrote:
>
>> FYI, we noticed the below changes on
>> =

>> https://git.kernel.org/pub/scm/linux/kernel/git/jikos/linux-block.git fo=
r-4.5/for-jens
>> commit 09954bad448791ef01202351d437abdd9497a804 ("floppy: refactor open(=
) flags handling")
>> =

>> =

>> [    6.750917] blk_update_request: I/O error, dev fd0, sector 0
>> [    6.751922] floppy: error -5 while reading block 0
>> =

>> =

>> To reproduce:
>> =

>>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-=
tests.git
>>         cd lkp-tests
>>         bin/lkp install job.yaml  # job file is attached in this email
>>         bin/lkp run     job.yaml
>
> Seem like I am probably rather bad reading the job.yaml syntax. Do you =

> happen to have C source that reproduces this? It's very likely that it's =

> actually an intended change in bahavior.

Sorry, we use shell script to do the test so we have no C source to
reproduce.  Could you try the above steps?

Best Regards,
Huang, Ying


--===============1239319111005413673==--

