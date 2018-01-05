Content-Type: multipart/mixed; boundary="===============0322437443810121083=="
MIME-Version: 1.0
From: Davidlohr Bueso <dave@stgolabs.net>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [perf machine] 8edf8850d5: stderr./usr/src/linux-perf-x86_64-rhel-#/tools/perf/util/rb_resort.h:#:#:error:passing_argument#of'threads_sorted__new'from_incompatible_pointer_type[-Werror=incompatible-pointer-types]
Date: Fri, 05 Jan 2018 09:04:47 -0800
Message-ID: <20180105170447.kcpuwmaspespxdv2@linux-n805>
In-Reply-To: <20180104055110.GC23834@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0322437443810121083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 04 Jan 2018, kernel test robot wrote:

>[   68.830934] /usr/src/linux-perf-x86_64-rhel-7.2-8edf8850d51e911a35b5d7a=
ad4f8604db11abc66/tools/perf/util/rb_resort.h:148:28: error: passing argume=
nt 1 of 'threads_sorted__new' from incompatible pointer type [-Werror=3Dinc=
ompatible-pointer-types]

I didn't have libaudit so I wasn't building builtin-trace, which obviously =
needs fixed.

Arnaldo, dunno if you're taking this series, but please let me know if you =
want a v2 or
you can fold the below fix into this patch.

Thanks,
Davidlohr

diff --git a/tools/perf/util/rb_resort.h b/tools/perf/util/rb_resort.h
index a920f702a74d..aa7a63628d75 100644
--- a/tools/perf/util/rb_resort.h
+++ b/tools/perf/util/rb_resort.h
@@ -140,12 +140,12 @@ struct __name##_sorted *__name =3D __name##_sorted__n=
ew
 =

 /* For 'struct intlist' */
 #define DECLARE_RESORT_RB_INTLIST(__name, __ilist)				\
-	DECLARE_RESORT_RB(__name)(&__ilist->rblist.entries,			\
+	DECLARE_RESORT_RB(__name)(&__ilist->rblist.entries.rb_root,		\
 				  __ilist->rblist.nr_entries)
 =

 /* For 'struct machine->threads' */
 #define DECLARE_RESORT_RB_MACHINE_THREADS(__name, __machine, hash_bucket)	\
-	DECLARE_RESORT_RB(__name)(&__machine->threads[hash_bucket].entries,	\
+	DECLARE_RESORT_RB(__name)(&__machine->threads[hash_bucket].entries.rb_roo=
t,\
 				  __machine->threads[hash_bucket].nr)
 =

 #endif /* _PERF_RESORT_RB_H_ */

--===============0322437443810121083==--

