Content-Type: multipart/mixed; boundary="===============6411033194632291921=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: lkp@lists.01.org
Subject: Re: [ata_port_probe] BUG: unable to handle kernel NULL pointer dereference at 0000000000000350
Date: Tue, 21 Nov 2017 16:30:22 +0100
Message-ID: <CAK8P3a0M6RxUwTQ62zWZY8dKYfki62V8_MDMpn2Z2k-t_pYVoA@mail.gmail.com>
In-Reply-To: <20171121145719.GD983427@devbig577.frc2.facebook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6411033194632291921==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2017 at 3:57 PM, Tejun Heo <tj@kernel.org> wrote:
> Hello,
>
> On Tue, Nov 21, 2017 at 01:54:25PM +0100, Arnd Bergmann wrote:
>> > [   56.376960] ata2.00: ATAPI: QEMU DVD-ROM, 2.5+, max UDMA/100
>> > [   56.379169] ata2.00: configured for MWDMA2
>> > [   56.381518] ata2.00: disabled
>> > [   56.385696] sd 1:0:0:0: [sda] Attached SCSI disk
>> > [   56.395326] sd 1:0:0:0: [sda] Synchronizing SCSI cache
>>
>> I guess both can be explained by the same race as the previous one, with
>> async probe racing against removal. The first one might be a use-after-f=
ree
>> problem, the second one could be the probing thread running after the
>> device got removed.
>
> This is not a bug in libata.  This is caused by
> CONFIG_DEBUG_TEST_DRIVER_REMOVE incorrectly detaching the driver
> before probing is complete, which can't happen in normal operations
> (we have async flush at the end of boot and around module operations).
>
> Greg, this issue was identified way back.  It's a debug code which
> causes failures which aren't possible.  Can we please either fix or
> remove it?

Maybe we can call async_synchronize_full() before the ->remove()?

    Arnd

--===============6411033194632291921==--

