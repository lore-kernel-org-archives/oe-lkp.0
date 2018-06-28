Content-Type: multipart/mixed; boundary="===============6598313255021176731=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH 6/6] fs: replace f_ops->get_poll_head with a static ->f_poll_head pointer
Date: Thu, 28 Jun 2018 14:39:25 -0700
Message-ID: <CA+55aFwnN5h=+BWNNG1aQ2d-6Yts+2e==ycnC3BEmBMcGbaP7g@mail.gmail.com>
In-Reply-To: <20180628213027.GK30522@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============6598313255021176731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2018 at 2:30 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> > Again, locking is permitted. It's not great, but it's not against the r=
ules.
>
> Me: a *LOT* of ->poll() instances only block in __pollwait() called (indi=
rectly)
> on the first pass.
>
> You: They are *all* supposed to do it.
>
> Me: <examples of instances that block elsewhere>

Oh, I thought you were talking about the whole "first pass" adding to
wait queues, as opposed to doing it on the second pass.

The *blocking* is entirely immaterial. I didn't even react to it,
because it's simply not an issue.

I don't understand why you're even hung up about it.

The only reason "blocking" seems to be an issu eis because AIO has
shit-for-brains and wanted to do poll() under the spinlock.

But that's literally just AIO being confused garbage. It has zero
relevance for anything else.

                Linus

--===============6598313255021176731==--

