Content-Type: multipart/mixed; boundary="===============6419721477045318073=="
MIME-Version: 1.0
From: Luck, Tony <tony.luck@intel.com>
To: lkp@lists.01.org
Subject: Re: [ACPI / APEI] a3e2acc5e3: kmsg.BERT:Can't_request_iomem_region<#-#>
Date: Tue, 12 Jul 2016 01:21:26 +0000
Message-ID: <E9EB2E0F-5635-4550-9761-FD3910828E3C@intel.com>
In-Reply-To: <20160712005201.GE19249@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6419721477045318073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Get BIOS version with:

# dmidecode   -t  0

Sent from my iPhone

> On Jul 11, 2016, at 17:54, Ye, Xiaolong <xiaolong.ye@intel.com> wrote:
> =

>> On Sun, Jul 10, 2016 at 08:28:37PM -0700, Tony Luck wrote:
>> I'm very surprised that there was a BERT table on an Atom machine. More =
details about the machine please. Also BIOS version.
> =

> Hi, ying
> =

> Could you tell me what's BERT table? and how to check the BIOS version?
> =

> Thanks,
> Xiaolong
> =

>> =

>> Sent from my iPhone
>> =

>>> On Jul 10, 2016, at 18:43, kernel test robot <xiaolong.ye@intel.com> =
wrote:
>>> =

>>> =

>>> FYI, we noticed the following commit:
>>> =

>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mas=
ter
>>> commit a3e2acc5e37b22b6808a0b8e46887c3577de9c9e ("ACPI / APEI: Add Boot=
 Error Record Table (BERT) support")
>>> =

>>> in testcase: locktorture
>>> with following parameters: runtime=3D300s
>>> =

>>> on test machine: Atom with 8G memory
>>> =

>>> caused below changes:
>>> =

>>> =

>>> [   12.317148] BERT: Can't request iomem region <00000000bfccfc18-00000=
000bfccfc2b>.
>>> =

>>> =

>>> =

>>> To reproduce:
>>> =

>>>       git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>>>       cd lkp-tests
>>>       bin/lkp install job.yaml  # job file is attached in this email
>>>       bin/lkp run     job.yaml
>>> =

>>> =

>>> =

>>> Thanks,
>>> Xiaolong
>>> <config-4.7.0-rc4-00003-ga3e2acc>
>>> <kmsg.xz>
>>> <job.yaml>

--===============6419721477045318073==--

