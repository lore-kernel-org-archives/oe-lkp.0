Content-Type: multipart/mixed; boundary="===============8927593713995602639=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] objtool, static_call: Don't emit static_call_site for .exit.text
Date: Wed, 17 Mar 2021 19:02:12 -0500
Message-ID: <20210318000212.l2fdz5vjhuq64yh6@treble>
In-Reply-To: <YFH6BR61b5GK8ITo@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============8927593713995602639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 01:45:57PM +0100, Peter Zijlstra wrote:
> arguably it simply isn't a good idea to use static_call() in __exit
> code anyway, since module unload is never a performance critical path.

Couldn't you make the same argument about __init functions, which are
allowed to do static calls?

We might consider a STATIC_CALL_SITE_EXIT flag, but I suppose we've run
out of flag space.

-- =

Josh

--===============8927593713995602639==--

