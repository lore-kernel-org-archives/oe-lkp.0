Content-Type: multipart/mixed; boundary="===============4632845875159043933=="
MIME-Version: 1.0
From: Theodore Ts'o <tytso@mit.edu>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Fri, 14 Jul 2017 17:34:49 -0400
Message-ID: <20170714213449.gtxtkqtxifk5j4wp@thunk.org>
In-Reply-To: <1500064799.2853.36.camel@HansenPartnership.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4632845875159043933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2017 at 01:39:59PM -0700, James Bottomley wrote:
> but why? =C2=A0That's partly the point of all of this: some security.
> attributes can't be written by container root without some supervision
> (the capability ones are the hugely problematic ones from this point of
> view), but for some there's no reason they shouldn't be. =C2=A0What would=
 be
> the reason that root in a container shouldn't be able to write the ima
> xattr the same as host root could on its filesystem?

So I'm happy to say, "Ix-nay on nested containerization; that way lies
insanity".  But my understanding is that there will be people who want
to run containers in containers in containers in containers...  and
this is what scares me.

What if someone in the Nth layer of containerization wants to allow
the container root in the (N+1)th layer to set file capabilities that
will not be honored in the Nth layer of containerization?

Again I think that this is insane, and I'm happy for the answer to be,
"No, that's not supported".  That the "Host container" can have
capabilities that it won't honor, but will be honored by all
subcontainers, but that same thing can't be done between a
subsubsub-container and its child subsubsubsub-container.

Are we OK with that?  Because how we would encode this in the xattr
seems to be to be hopelessly not scalable.

					- Ted

--===============4632845875159043933==--

