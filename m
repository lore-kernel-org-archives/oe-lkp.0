Content-Type: multipart/mixed; boundary="===============7494904101051698236=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH v3] mm: fs: invalidate bh_lrus for only cold path
Date: Mon, 20 Sep 2021 17:23:38 -0700
Message-ID: <CAHk-=wgr+xHSgita2Q-HD2CPx5dfgY2jhnLwjk7Gtuv+bOxipA@mail.gmail.com>
In-Reply-To: <YUkeOB3GfK6KO8KG@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7494904101051698236==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 4:50 PM Minchan Kim <minchan@kernel.org> wrote:
>
> I have no idea why I couldn't find the reply from lore.kernel.org/lkml/
> The message id was 89e2b66b-c706-c020-bff5-b815dcd5c461(a)intel.com
> in the thread(https://lore.kernel.org/lkml/20210520083144.GD14190(a)xsang=
-OptiPlex-9020/)

Hmm. That message-id isn't found anywhere.

Maybe it was sent just to you personally?

[ Goes off and looks ]

Nope, I can see it in my mails too, and yeah, I see

  To: Minchan Kim <minchan@kernel.org>, kernel test robot
<oliver.sang@intel.com>
  Cc: Linus Torvalds <torvalds@linux-foundation.org>, Chris
Goldsworthy <cgoldswo@codeaurora.org>, Laura Abbott
<labbott@kernel.org>, David Hildenbrand <david@redhat.com>, John Dias
<joaodias@google.com>, Matthew Wilcox <willy@infradead.org>, Michal
Hocko <mhocko@suse.com>, Suren Baghdasaryan <surenb@google.com>,
Vlastimil Babka <vbabka@suse.cz>, Andrew Morton
<akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>,
lkp(a)lists.01.org, lkp(a)intel.com
  References: <20210520083144.GD14190@xsang-OptiPlex-9020>
<YKasEeXCr9R5yzCr@google.com>
  From: "Xing, Zhengjun" <zhengjun.xing@intel.com>
  Message-ID: <89e2b66b-c706-c020-bff5-b815dcd5c461@intel.com>

but lore has no idea about it:

  https://lore.kernel.org/all/89e2b66b-c706-c020-bff5-b815dcd5c461(a)intel.=
com/

just says "Message-ID <89e2b66b-c706-c020-bff5-b815dcd5c461@intel.com>
not found".

Strange.

Something presumably caused the list to drop that email.

           Linus
--===============7494904101051698236==--

