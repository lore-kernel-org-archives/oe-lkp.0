Content-Type: multipart/mixed; boundary="===============2092782428301179945=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 11 Aug 2016 19:32:55 -0700
Message-ID: <CA+55aFyVtYtT78LvKmDCd0XyZhber=qmFCsDSQrPyw-oqCw2Yg@mail.gmail.com>
In-Reply-To: <20160812022329.GP19025@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============2092782428301179945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 7:23 PM, Dave Chinner <david@fromorbit.com> wrote:
>
> And, as usual, that's the answer. Here's the reproducer:
>
> # sudo mkfs.xfs -f -m crc=3D0 /dev/pmem1
> # sudo mount -o noatime /dev/pmem1 /mnt/scratch
> # sudo xfs_io -f -c "pwrite 0 512m -b 1" /mnt/scratch/fooey

Heh. Ok, so 1 byte or 1kB at a time is pretty much the same thing, yeah.

And I guess that also explains why the system call entry showed up so
high in the profiles.

I'l take another look at tree_lock tomorrow, but it sounds like this
particular AIM regression is now effectively a solved (or at least
known) issue. Thanks,

              Linus

--===============2092782428301179945==--

