Content-Type: multipart/mixed; boundary="===============9032418211706097311=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: 4ce5f9c9e7 [ 1.323881] WARNING: CPU: 0 PID: 1 at mm/slab_common.c:1031 kmalloc_slab
Date: Wed, 10 Oct 2018 17:06:52 -0500
Message-ID: <87h8htv4lf.fsf@xmission.com>
In-Reply-To: <87sh1dvmc5.fsf@xmission.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9032418211706097311==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ebiederm(a)xmission.com (Eric W. Biederman) writes:

> So I am flummoxed.  I am reading through the code and I don't see
> anything that could trigger this, and when I ran the supplied reproducer
> it did not reproduce for me.

Even more so.  With my tool chain the line that reports the failing
address is impossible.

[   73.034423] RIP: 0010:copy_siginfo_from_user+0x4d/0xd0

With the supplied configureation my tool chain only has 0x30 bytes for
all of copy_siginfo_from_user.  So I can't even begin to guess where
in that function things are failing.

Any additional information that you can provide would be a real help
in tracking down this strange failure.

Thank you,
Eric Biederman


--===============9032418211706097311==--

