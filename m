Content-Type: multipart/mixed; boundary="===============5681642150813755826=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: 0a3856392c [ 10.513760] INFO: trying to register non-static key.
Date: Thu, 06 Sep 2018 19:19:37 -0700
Message-ID: <20180907021937.GA7440@bombadil.infradead.org>
In-Reply-To: <20180907010539.GB6655@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5681642150813755826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 07, 2018 at 09:05:39AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> commit 0a3856392cff1542170b5bc37211c9a21fd0c3f6
> Author:     Matthew Wilcox <willy@infradead.org>
> AuthorDate: Mon Jun 18 17:23:37 2018 -0400
> Commit:     Matthew Wilcox <willy@infradead.org>
> CommitDate: Tue Aug 21 23:54:20 2018 -0400
> =

>     test_ida: Move ida_check_leaf
>     =

>     Convert to new API and move to kernel space.  Take the opportunity to
>     test the situation a little more thoroughly (ie at different offsets).
>     =

>     Signed-off-by: Matthew Wilcox <willy@infradead.org>

Thank you test-bot.  Can you check if this patch fixes the problem?

diff --git a/lib/test_ida.c b/lib/test_ida.c
index 2d1637d8136b..b06880625961 100644
--- a/lib/test_ida.c
+++ b/lib/test_ida.c
@@ -150,10 +150,10 @@ static void ida_check_conv(struct ida *ida)
 	IDA_BUG_ON(ida, !ida_is_empty(ida));
 }
 =

+static DEFINE_IDA(ida);
+
 static int ida_checks(void)
 {
-	DEFINE_IDA(ida);
-
 	IDA_BUG_ON(&ida, !ida_is_empty(&ida));
 	ida_check_alloc(&ida);
 	ida_check_destroy(&ida);


--===============5681642150813755826==--

