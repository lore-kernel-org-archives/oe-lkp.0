Content-Type: multipart/mixed; boundary="===============2196885776982002320=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: 266a9a8b41: WARNING:possible_recursive_locking_detected
Date: Sun, 15 Sep 2019 20:44:05 -0700
Message-ID: <CAHk-=wii2apAb9WHCaOt8vnQjk8yXAHnMEC6im0f0YiEF4PwOA@mail.gmail.com>
In-Reply-To: <20190916030355.GZ1131@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============2196885776982002320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2019 at 8:04 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Perhaps lockref_get_nested(struct lockref *lockref, unsigned int subclass=
)?
> With s/spin_lock/spin_lock_nested/ in the body...

Sure. Under the usual CONFIG_DEBUG_LOCK_ALLOC, with the non-debug case
just turning into a regular lockref_get().

Sounds fine to me.

             Linus

--===============2196885776982002320==--

