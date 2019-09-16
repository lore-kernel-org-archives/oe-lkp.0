Content-Type: multipart/mixed; boundary="===============6393942719863218019=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: 266a9a8b41: WARNING:possible_recursive_locking_detected
Date: Mon, 16 Sep 2019 18:29:45 +0100
Message-ID: <20190916172945.GB1131@ZenIV.linux.org.uk>
In-Reply-To: <20190916171606.GA1131@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============6393942719863218019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2019 at 06:16:06PM +0100, Al Viro wrote:
> On Sun, Sep 15, 2019 at 08:44:05PM -0700, Linus Torvalds wrote:
> > On Sun, Sep 15, 2019 at 8:04 PM Al Viro <viro@zeniv.linux.org.uk> wro=
te:
> > >
> > > Perhaps lockref_get_nested(struct lockref *lockref, unsigned int subc=
lass)?
> > > With s/spin_lock/spin_lock_nested/ in the body...
> > =

> > Sure. Under the usual CONFIG_DEBUG_LOCK_ALLOC, with the non-debug case
> > just turning into a regular lockref_get().
> > =

> > Sounds fine to me.
> =

> Done and force-pushed into vfs.git#fixes

BTW, folks, I would really appreciate more people _testing_ that thing;
it survives the local beating, but...

--===============6393942719863218019==--

