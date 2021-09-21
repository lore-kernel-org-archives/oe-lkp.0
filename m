Content-Type: multipart/mixed; boundary="===============0902505913743393159=="
MIME-Version: 1.0
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH v3] mm: fs: invalidate bh_lrus for only cold path
Date: Mon, 20 Sep 2021 21:03:53 -0400
Message-ID: <20210921010353.shmojvzdtbijva57@meerkat.local>
In-Reply-To: <CAHk-=wgr+xHSgita2Q-HD2CPx5dfgY2jhnLwjk7Gtuv+bOxipA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0902505913743393159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 05:23:38PM -0700, Linus Torvalds wrote:
> Hmm. That message-id isn't found anywhere.
> =

> Maybe it was sent just to you personally?
> =

> [ Goes off and looks ]
> =

> Nope, I can see it in my mails too, and yeah, I see
> =

>   To: Minchan Kim <minchan@kernel.org>, kernel test robot
> <oliver.sang@intel.com>
>   Cc: Linus Torvalds <torvalds@linux-foundation.org>, Chris
> Goldsworthy <cgoldswo@codeaurora.org>, Laura Abbott
> <labbott@kernel.org>, David Hildenbrand <david@redhat.com>, John Dias
> <joaodias@google.com>, Matthew Wilcox <willy@infradead.org>, Michal
> Hocko <mhocko@suse.com>, Suren Baghdasaryan <surenb@google.com>,
> Vlastimil Babka <vbabka@suse.cz>, Andrew Morton
> <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>,
> lkp(a)lists.01.org, lkp(a)intel.com
>   References: <20210520083144.GD14190@xsang-OptiPlex-9020>
> <YKasEeXCr9R5yzCr@google.com>
>   From: "Xing, Zhengjun" <zhengjun.xing@intel.com>
>   Message-ID: <89e2b66b-c706-c020-bff5-b815dcd5c461@intel.com>
> =

> but lore has no idea about it:
> =

>   https://lore.kernel.org/all/89e2b66b-c706-c020-bff5-b815dcd5c461(a)inte=
l.com/
> =

> just says "Message-ID <89e2b66b-c706-c020-bff5-b815dcd5c461@intel.com>
> not found".
> =

> Strange.
> =

> Something presumably caused the list to drop that email.

I think vger is backed up. I've flagged this with John, hopefully he'll be
able to figure out what's keeping things from hitting the archives.

-K
--===============0902505913743393159==--

