Content-Type: multipart/mixed; boundary="===============7480652939530367180=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 1be7107fbe: kernel_BUG_at_mm/mmap.c
Date: Wed, 21 Jun 2017 15:19:36 -0700
Message-ID: <CA+55aFzVEzC=FkFihCOyHyDkMP+eq_DR826oXLinrJ7YmENZ7Q@mail.gmail.com>
In-Reply-To: <20170621205617.GA29841@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7480652939530367180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2017 at 1:56 PM, Oleg Nesterov <oleg@redhat.com> wrote:
>
> I understand. My point is that this check was invalidated by stack-guard-=
page
> a long ago, and this means that we add the user-visible change now.

Yeah. I guess we could consider it an *old* regression that got fixed,
but if people started relying on the regression...

>> Do you have a pointer to the report for this regression? I must have mis=
sed it.
>
> See http://marc.info/?t=3D149794523000001&r=3D1&w=3D2

Ok.

And thinking about it, while that is a silly test-case, the notion of
"create top-down segment, then start populating it _before_ moving the
stack pointer into it" is actually perfectly valid.

So I guess checking against the stack pointer is wrong in that case -
at least if the stack pointer isn't inside that vma to begin with.

So yes, removing that check looks like the right thing to do for now.

Do you want to send me the patch if you already have a commit message etc?

                    Linus

--===============7480652939530367180==--

