Content-Type: multipart/mixed; boundary="===============8629599549483682216=="
MIME-Version: 1.0
From: Thomas Graf <tgraf@suug.ch>
To: lkp@lists.01.org
Subject: Re: Fwd: [rhashtable] WARNING: CPU: 0 PID: 10 at kernel/locking/mutex.c:570 mutex_lock_nested()
Date: Tue, 13 Jan 2015 19:28:47 +0000
Message-ID: <20150113192847.GP20387@casper.infradead.org>
In-Reply-To: <CAHA+R7M1ZSCF+FwKVtZUbsJ05zesNg-WVTqH13=oFe5gM--3gw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8629599549483682216==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/13/15 at 11:14am, Cong Wang wrote:
> On Tue, Jan 13, 2015 at 12:41 AM, Thomas Graf <tgraf@suug.ch> wrote:
> > I can't reproduce it in my KVM box either so far. It looks like a
> > mutex_lock() on an uninitialized mutex or use after free but I can't
> > find such a code path so far.
> =

> Couldn't that be the delayed work is still running after rhashtable
> is destroyed by its caller? I mean, cancel_delayed_work_sync()
> should be called in rhashtable_destroy()?
> =

> Of course, it may be caller's responsibility to ensure that, I haven't
> looked into it that much.

Yes, we came to the very same conclusion in a different email thread
and found the offending race condition.

--===============8629599549483682216==--

