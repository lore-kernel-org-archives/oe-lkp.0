Content-Type: multipart/mixed; boundary="===============1802692813724207983=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] objtool, static_call: Don't emit static_call_site for .exit.text
Date: Thu, 18 Mar 2021 08:59:45 +0100
Message-ID: <YFMIcWIbk0aN30NY@hirez.programming.kicks-ass.net>
In-Reply-To: <20210318000212.l2fdz5vjhuq64yh6@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============1802692813724207983==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 07:02:12PM -0500, Josh Poimboeuf wrote:
> On Wed, Mar 17, 2021 at 01:45:57PM +0100, Peter Zijlstra wrote:
> > arguably it simply isn't a good idea to use static_call() in __exit
> > code anyway, since module unload is never a performance critical path.
> =

> Couldn't you make the same argument about __init functions, which are
> allowed to do static calls?

I suppose we could indeed make that argument. Much of that code was
copied from jump_label without much consideration. And I now I suppose
I'll have to consider jump_label in __exit too :/

> We might consider a STATIC_CALL_SITE_EXIT flag, but I suppose we've run
> out of flag space.

Yeah, we're definitely short on flags. Let me try and figure out when
exactly it's all discarded.
--===============1802692813724207983==--

