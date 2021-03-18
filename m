Content-Type: multipart/mixed; boundary="===============9015260671996921319=="
MIME-Version: 1.0
From: Sumit Garg <sumit.garg@linaro.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] objtool, static_call: Don't emit static_call_site for .exit.text
Date: Thu, 18 Mar 2021 10:12:43 +0530
Message-ID: <CAFA6WYOM=y_8x=ziehOMKMFh1Va0_W6nmXfYtxKE28fM0BumPQ@mail.gmail.com>
In-Reply-To: <YFJ66nW0vabAgGqm@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============9015260671996921319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 18 Mar 2021 at 03:26, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Wed, Mar 17, 2021 at 07:07:07PM +0530, Sumit Garg wrote:
> > On Wed, 17 Mar 2021 at 18:16, Peter Zijlstra <peterz@infradead.org> w=
rote:
> > >
> > > On Wed, Mar 17, 2021 at 05:25:48PM +0530, Sumit Garg wrote:
> > > > Thanks Peter for this fix. It does work for me on qemu for x86. Can
> > > > you turn this into a proper fix patch? BTW, feel free to add:
> > >
> > > Per the below, the original patch ought to be fixed as well, to not u=
se
> > > static_call() in __exit.
> >
> > Okay, fair enough.
> >
> > Jarkko,
> >
> > Can you please incorporate the following change to the original patch a=
s well?
>
> Can you roll-out a proper patch of this?

Okay, I will post a separate patch for this.

-Sumit

>
> /Jarkko
--===============9015260671996921319==--

