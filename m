Content-Type: multipart/mixed; boundary="===============2580301837916190872=="
MIME-Version: 1.0
From: Martin K. Petersen <martin.petersen@oracle.com>
To: lkp@lists.01.org
Subject: Re: [scsi] 9393c8de62: Initramfs_unpacking_failed
Date: Fri, 08 Nov 2019 21:12:27 -0500
Message-ID: <yq1v9rtvlv8.fsf@oracle.com>
In-Reply-To: <6ad8eeef-101e-58ba-734d-1725c998a909@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2580301837916190872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Michael,

>>> [    1.278970] Trying to unpack rootfs image as initramfs...
>>> [    4.011404] Initramfs unpacking failed: broken padding
>>
>> Was this test failure unrelated to commit 9393c8de62?
>
> Seems to be unrelated - a m68k kernel with that commit included, SCSI
> core included but low-level driver built as a module(*)  boots into
> the initramfs just fine.
>
> (*) well-known emulator bug.

I'm scratching my head too. I have tested a variety of systems and all
of them boot and work fine.

-- =

Martin K. Petersen	Oracle Linux Engineering
--===============2580301837916190872==--

