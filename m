Content-Type: multipart/mixed; boundary="===============0192485708738293434=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Wed, 05 Dec 2018 16:58:02 -0800
Message-ID: <CAHk-=wjm9V843eg0uesMrxKnCCq7UfWn8VJ+z-cNztb_0fVW6A@mail.gmail.com>
In-Reply-To: <CAHk-=wguXjkbK8BUU998s7HD7AXJgBkuc9JmuNxiN7uGQyfSfQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0192485708738293434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 5, 2018 at 3:51 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Ok, I've applied David's latest patch.
>
> I'm not at all objecting to tweaking this further, I just didn't want
> to have this regression stand.

Hmm. Can somebody (David?) also perhaps try to state what the
different latency impacts end up being? I suspect it's been mentioned
several times during the argument, but it would be nice to have a
"going forward, this is what I care about" kind of setup for good
default behavior.

How much of the problem ends up being about the cost of compaction vs
the cost of getting a remote node bigpage?

That would seem to be a fairly major issue, but __GFP_THISNODE affects
both. It limits compaction to just this now, in addition to obviously
limiting the allocation result.

I realize that we probably do want to just have explicit policies that
do not exist right now, but what are (a) sane defaults, and (b) sane
policies?

For example, if we cannot get a hugepage on this node, but we *do* get
a node-local small page, is the local memory advantage simply better
than the possible TLB advantage?

Because if that's the case (at least commonly), then that in itself is
a fairly good argument for "hugepage allocations should always be
THISNODE".

But David also did mention the actual allocation overhead itself in
the commit, and maybe the math is more "try to get a local hugepage,
but if no such thing exists, see if you can get a remote hugepage
_cheaply_".

So another model can be "do local-only compaction, but allow non-local
allocation if the local node doesn't have anything". IOW, if other
nodes have hugepages available, pick them up, but don't try to compact
other nodes to do so?

And yet another model might be "do a least-effort thing, give me a
local hugepage if it exists, otherwise fall back to small pages".

So there are different combinations of "try compaction" vs "local-remote".

                      Linus

--===============0192485708738293434==--

