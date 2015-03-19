Content-Type: multipart/mixed; boundary="===============5259751903874037880=="
MIME-Version: 1.0
From: Sudeep Holla <sudeep.holla@arm.com>
To: lkp@lists.01.org
Subject: Re: [x86/cacheinfo] 0d55ba46bfb: WARNING: CPU: 31 PID: 1 at fs/sysfs/group.c:102 internal_create_group+0x151/0x280()
Date: Thu, 19 Mar 2015 09:32:09 +0000
Message-ID: <550A9799.2080404@arm.com>
In-Reply-To: <1426732130.5570.43.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5259751903874037880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Huang,

On 19/03/15 02:28, Huang Ying wrote:
> FYI, we noticed the below changes on
>
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 0d55ba46bfbee64fd2b492b87bfe2ec172e7b056 ("x86/cacheinfo: Move cac=
heinfo sysfs code to generic infrastructure")
>
[...]
>
> [    8.700596] Non-volatile memory driver v1.3
> [    8.705684] Linux agpgart interface v0.103
> [    8.711362] ------------[ cut here ]------------
> [    8.716832] WARNING: CPU: 31 PID: 1 at fs/sysfs/group.c:102 internal_c=
reate_group+0x151/0x280()
> [    8.729104] sysfs: (bin_)attrs not set by subsystem for group: index3/

IIUC, a modified version(as per the discussion on that thread) of the
patch[1] posted a while ago fixed this issue. I had assumed Boris had
pulled, but seem to have missed. Boris, is that right ?

Regards,
Sudeep

[1] https://lkml.org/lkml/2015/3/10/342


--===============5259751903874037880==--

