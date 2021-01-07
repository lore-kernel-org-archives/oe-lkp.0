Content-Type: multipart/mixed; boundary="===============5359704859630905516=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [x86] d55564cfc2: will-it-scale.per_thread_ops -5.8% regression
Date: Thu, 07 Jan 2021 18:40:58 +0000
Message-ID: <20210107184058.GH3579531@ZenIV.linux.org.uk>
In-Reply-To: <20210107183358.GG3579531@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============5359704859630905516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2021 at 06:33:58PM +0000, Al Viro wrote:
> On Thu, Jan 07, 2021 at 09:43:54AM -0800, Linus Torvalds wrote:
> =

> > Before, it would do the whole CLAC/STAC dance inside that loop for
> > every entry (and with that commit d55564cfc22 it would be a function
> > call, of course).
> > =

> > Can you verify that this fixes the regression (and in fact I'd expect
> > it to improve that test-case)?
> =

> I'm not sure it's the best approach, TBH.  How about simply
>         for (walk =3D head; walk; ufds +=3D walk->len, walk =3D walk->nex=
t) {
> 		if (copy_to_user(ufds, walk->entries,
> 				 walk->len * sizeof(struct pollfd))
> 			goto out_fds;
>         }
> in there?  It's both simpler (obviously matches the copyin side) and
> might very well be faster...

Something like

do_sys_poll(): do the wholesale copyout

Don't bother with patching up just one field - 16 bits out of each 64.
The amount of memory traffic is not going to be greater (might be
smaller, actually) and the loop in copy_to_user() is optimized for
bulk copy.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
diff --git a/fs/select.c b/fs/select.c
index ebfebdfe5c69..288633053c7f 100644
--- a/fs/select.c
+++ b/fs/select.c
@@ -1011,12 +1011,9 @@ static int do_sys_poll(struct pollfd __user *ufds, u=
nsigned int nfds,
 	fdcount =3D do_poll(head, &table, end_time);
 	poll_freewait(&table);
 =

-	for (walk =3D head; walk; walk =3D walk->next) {
-		struct pollfd *fds =3D walk->entries;
-		int j;
-
-		for (j =3D 0; j < walk->len; j++, ufds++)
-			if (__put_user(fds[j].revents, &ufds->revents))
+	for (walk =3D head; walk; ufds +=3D walk->len, walk =3D walk->next) {
+		if (copy_to_user(ufds, walk->entries,
+				 walk->len * sizeof(struct pollfd)))
 				goto out_fds;
   	}
=20
--===============5359704859630905516==--

