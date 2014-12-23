Content-Type: multipart/mixed; boundary="===============5473895101380054034=="
MIME-Version: 1.0
From: Rusty Russell <rusty@rustcorp.com.au>
To: lkp@lists.01.org
Subject: Re: [PATCH] drm/radeon: Try to init amdkfd only if 64 bit kernel
Date: Wed, 24 Dec 2014 09:31:13 +1030
Message-ID: <874msmt1hi.fsf@rustcorp.com.au>
In-Reply-To: <54986EA2.106@amd.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5473895101380054034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Oded Gabbay <oded.gabbay@amd.com> writes:
> I didn't say it doesn't always work.
> The actual thing that doesn't work is the define symbol_get and only in a
> specific case of 32bit kernel AND CONFIG_MODULES is unset AND
> CONFIG_RANDOMIZE_BASE is set.
> The define in that case is:
> #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak)); &(x); =
})
>
> Why it doesn't work (doesn't return NULL when symbol doesn't exists) ?

Hmm, I'd guess CONFIG_RANDOMIZE_BASE is relocating NULL symbols...

No, I can't reproduce this.  Please send your .config privately.

Here's my test case:

diff --git a/init/main.c b/init/main.c
index 61b993767db5..a3ee1ec97ec3 100644
--- a/init/main.c
+++ b/init/main.c
@@ -683,6 +683,12 @@ asmlinkage __visible void __init start_kernel(void)
 =

 	ftrace_init();
 =

+	{
+		extern void nonexistent_fn(void);
+		printk("symbol_get(nonexistent_fn) =3D %p\n",
+		       symbol_get(nonexistent_fn));
+	}
+
 	/* Do the rest non-__init'ed, we're now alive */
 	rest_init();
 }

Thanks,
Rusty.

--===============5473895101380054034==--

