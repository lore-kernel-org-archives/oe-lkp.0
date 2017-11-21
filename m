Content-Type: multipart/mixed; boundary="===============8119083794385921729=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: lkp@lists.01.org
Subject: Re: [ata_port_probe] BUG: unable to handle kernel NULL pointer dereference at 0000000000000350
Date: Tue, 21 Nov 2017 13:54:25 +0100
Message-ID: <CAK8P3a1c+u-r6+AD8=eKfRaoTgx0ByV_mVJWoJu7BzfDLk1JBA@mail.gmail.com>
In-Reply-To: <20171121121915.k3jcazsc6eugdo3k@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8119083794385921729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2017 at 1:19 PM, Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
> On Tue, Nov 21, 2017 at 08:09:35PM +0800, Fengguang Wu wrote:
>>
>> Hello,
>>
>> FYI this happens in mainline kernel 4.14.0-00902-g43ff2f4.
>> It looks happen since 4.11.
>>
>> It occurs in 12 out of 108 boots.
>>
>> [   20.057810] ata2: PATA max MWDMA2 cmd 0x170 ctl 0x376 bmdma 0xc0c8 irq
>> 15
>> [   20.219346] ata2.01: NODEV after polling detection
>> [   20.222140] ata2.00: ATAPI: QEMU DVD-ROM, 2.5+, max UDMA/100
>> [   20.232461] ata2.00: configured for MWDMA2
>> [   20.235209] ata2.00: disabled
>> [   20.247746] BUG: unable to handle kernel NULL pointer dereference at
>> 0000000000000350
>> [   20.250638] IP: ata_port_wait_eh+0xa1/0xe5:
>>
>
>
> Here is a similar issue in ata_scsi_scan_host(). It only happened once.
>
>
> /pkg/linux/x86_64-randconfig-in0-11110243/gcc-6/cf9b0772f2e410645fece13b7=
49bd56505b998b8/dmesg-vm-ivb41-quantal-x86_64-4:20171120120806:x86_64-randc=
onfig-in0-11110243:4.14.0-10859-gcf9b077:1
>
> [   56.376960] ata2.00: ATAPI: QEMU DVD-ROM, 2.5+, max UDMA/100
> [   56.379169] ata2.00: configured for MWDMA2
> [   56.381518] ata2.00: disabled
> [   56.385696] sd 1:0:0:0: [sda] Attached SCSI disk
> [   56.395326] sd 1:0:0:0: [sda] Synchronizing SCSI cache

I guess both can be explained by the same race as the previous one, with
async probe racing against removal. The first one might be a use-after-free
problem, the second one could be the probing thread running after the
device got removed.

           Arnd

--===============8119083794385921729==--

