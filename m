Content-Type: multipart/mixed; boundary="===============1211706586109801960=="
MIME-Version: 1.0
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: lkp@lists.01.org
Subject: Re: [mm/highmem] 61b205f579: WARNING:at_mm/highmem.c:#__kmap_local_sched_out
Date: Tue, 09 Mar 2021 20:53:04 +0000
Message-ID: <
 <BYAPR04MB496507720FEEF2B77FB639E186929@BYAPR04MB4965.namprd04.prod.outlook.com>>
In-Reply-To: <20210304083825.GB17830@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1211706586109801960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ira,

On 3/4/21 00:23, kernel test robot wrote:
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 61b205f579911a11f0b576f73275eca2aed0d108 ("mm/highmem: Convert me=
mcpy_[to|from]_page() to kmap_local_page()")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
>
> in testcase: trinity
> version: trinity-static-i386-x86_64-f93256fb_2019-08-28
> with following parameters:
>
> 	runtime: 300s
>
> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
>
>
> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
8G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

Is the fix for this been posted yet ?

(asking since I didn't see the fix and my mailer is dropping emails from
 lkml).

--===============1211706586109801960==--

