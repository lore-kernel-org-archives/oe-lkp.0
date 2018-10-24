Content-Type: multipart/mixed; boundary="===============6469007038088693359=="
MIME-Version: 1.0
From: Joe Perches <joe@perches.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] Change judgment len position
Date: Wed, 24 Oct 2018 16:46:18 -0700
Message-ID: <49ec92564284b5beb0a151bce1d537b51340d0a8.camel@perches.com>
In-Reply-To: <20181024204852.GA25509@1wt.eu>
List-Id: <oe-lkp.lists.linux.dev>

--===============6469007038088693359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

(adding Fengguang Wu and lkp)

On Wed, 2018-10-24 at 22:48 +0200, Willy Tarreau wrote:
> When you read this patch from an apparent first-time contributor (no
> trace in either LKML, netdev or even google), the level of assurance
> in the commit message is pretty good, showing that he's not at all a
> beginner, which doesn't match at all the type of error seen in the
> code, which doesn't even need to be compiled to see that it will emit
> a warning and not work as advertised.

Which to me is more of an indication of beginner-ness.

> When you factor in the fact that the code opens a big but very discrete
> vulnerability, I tend to think that in fact we're not facing a newbie
> at all but someone deliberately trying to inject a subtle backdoor into
> the kernel and disguise it as a vague bug fix,

That seems unlikely as it introduces a compilation warning.

A real intentional backdoor from a nefarious source would
likely be completely correct about compilation and use the
typical commit subject style.

Anyway, who know for certain right now.

I would have suggested David reply with only his second sentence
and maybe a pointer to kernelnewbies or staging.

Just something like:

	nack: 'len' has no value before the get_user() call.

	Please try to make your first patch in drivers/staging
	to get familiar with submitting patches to the kernel.
	https://kernelnewbies.org/FirstKernelPatch

Maybe there's utility in creating a filtering and auto-reply
tool for first time patch submitters for all the vger mailing
lists using some combination of previously known submitters
and the 0-day robot to point those first time submitters of
defective patches to kernelnewbies and staging.

cheers, Joe


--===============6469007038088693359==--

