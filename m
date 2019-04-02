Content-Type: multipart/mixed; boundary="===============6691445207055818581=="
MIME-Version: 1.0
From: Tobin C. Harding <tobin@kernel.org>
To: lkp@lists.01.org
Subject: [PATCH 0/1] slob: Fix list_head bug during allocation
Date: Tue, 02 Apr 2019 14:29:56 +1100
Message-ID: <20190402032957.26249-1-tobin@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6691445207055818581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

This patch is in response to an email from the 0day kernel test robot
subject:

  340d3d6178 ("mm/slob.c: respect list_head abstraction layer"):  kernel BU=
G at lib/list_debug.c:31!


This patch applies on top of linux-next tag: next-20190401

It fixes a patch that was merged recently into mm:

  The patch titled
       Subject: mm/slob.c: respect list_head abstraction layer
  has been added to the -mm tree.  Its filename is
       slob-respect-list_head-abstraction-layer.patch
  =

  This patch should soon appear at
      http://ozlabs.org/~akpm/mmots/broken-out/slob-respect-list_head-abstr=
action-layer.patch
  and later at
      http://ozlabs.org/~akpm/mmotm/broken-out/slob-respect-list_head-abstr=
action-layer.patch


If reverting is easier than patching I can re-work this into another
version of the original (buggy) patch set which was the series:

  [PATCH 0/4] mm: Use slab_list list_head instead of lru

Please don't be afraid to give a firm response.  I'm new to mm and I'd
like to not be a nuisance if I can manage it ;)  I'd also like to fix
this in a way that makes your day as easy as possible.


The 0day kernel test robot found a bug in the slob allocator caused by a
patch from me recently merged into the mm tree.  This is the first time
the 0day has found a bug in already merged code of mine so I do not know
the exact protocol in regards to linking the fix with the report,
patching, reverting etc.

I was unable to reproduce the crash, I tried building with the config
attached to the email above but the kernel booted fine for me in Qemu.

So I re-worked the module originally used for testing, it can be found
here:

	https://github.com/tcharding/ktest/tree/master/list_head

>From this I think the list.h code added prior to the buggy patch is
ok.

Next I tried to find the bug just using my eyes.  This patch is the
result.  Unfortunately I can not understand why this bug was not
triggered _before_ I originally patched it.  Perhaps I'm not juggling
all the state perfectly in my head.  Anyways, this patch stops and code
calling list manipulation functions if the slab_list page member has
been modified during allocation.

The code in question revolves around an optimisation aimed at preventing
fragmentation at the start of a slab due to the first fit nature of the
allocation algorithm.

Full explanation is in the commit log for the patch, the short version
is; skip optimisation if page list is modified, this only occurs when an
allocation completely fills the slab and in this case the optimisation
is unnecessary since we have not fragmented the slab by this allocation.

This is more than just a bug fix, it significantly reduces the
complexity of the function while still fixing the reason for originally
touching this code (violation of list_head abstraction).

The only testing I've done is to build and boot a kernel in Qemu (with
CONFIG_LIST_DEBUG and CONFIG_SLOB) enabled).  However, as mentioned,
this method of testing did _not_ reproduce the 0day crash so if there
are better suggestions on how I should test these I'm happy to do so.

thanks,
Tobin.


Tobin C. Harding (1):
  slob: Only use list functions when safe to do so

 mm/slob.c | 50 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 20 deletions(-)

-- =

2.21.0


--===============6691445207055818581==--

