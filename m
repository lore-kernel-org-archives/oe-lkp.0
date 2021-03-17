Content-Type: multipart/mixed; boundary="===============8658113840896912677=="
MIME-Version: 1.0
From: Jarkko Sakkinen <jarkko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] objtool, static_call: Don't emit static_call_site for .exit.text
Date: Wed, 17 Mar 2021 23:55:54 +0200
Message-ID: <YFJ66nW0vabAgGqm@kernel.org>
In-Reply-To: <CAFA6WYNr8SR=20LKJD0+AyrVXLY2CqQPqRE_60EestYv9L5AcA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8658113840896912677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 07:07:07PM +0530, Sumit Garg wrote:
> On Wed, 17 Mar 2021 at 18:16, Peter Zijlstra <peterz@infradead.org> wro=
te:
> >
> > On Wed, Mar 17, 2021 at 05:25:48PM +0530, Sumit Garg wrote:
> > > Thanks Peter for this fix. It does work for me on qemu for x86. Can
> > > you turn this into a proper fix patch? BTW, feel free to add:
> >
> > Per the below, the original patch ought to be fixed as well, to not use
> > static_call() in __exit.
> =

> Okay, fair enough.
> =

> Jarkko,
> =

> Can you please incorporate the following change to the original patch as =
well?

Can you roll-out a proper patch of this?

/Jarkko
--===============8658113840896912677==--

