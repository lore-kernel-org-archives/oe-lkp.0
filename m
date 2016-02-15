Content-Type: multipart/mixed; boundary="===============0651024501666441915=="
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
To: lkp@lists.01.org
Subject: Re: [gpio] 3c702e9987: kmsg.user_verbs:couldn't_register_device_number
Date: Mon, 15 Feb 2016 10:36:25 +0100
Message-ID: <CACRpkda2=P-pGktS+MXYBfjh1v-aBicg4i9T3_QPH4vNy8==kw@mail.gmail.com>
In-Reply-To: <8760xqd7e8.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0651024501666441915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2016 at 3:39 AM, Huang, Ying <ying.huang@intel.com> wrote:
> Michael Welling <mwelling@ieee.org> writes:

>> Could you run cat /proc/devices?
>
> Sorry, the test mechanism is not flexible enough to run some shell
> command in test system.  Could you provide a specialized debug kernel to
> dump the necessary information in kernel log?  We can collect dmesg
> easily.

Can you try this:

diff --git a/fs/char_dev.c b/fs/char_dev.c
index 24b142569ca9..74a2d433273e 100644
--- a/fs/char_dev.c
+++ b/fs/char_dev.c
@@ -96,6 +96,8 @@ __register_chrdev_region(unsigned int major,
unsigned int baseminor,
             goto out;
         }
         major =3D i;
+        pr_info("CHARDEV: allocate major %d for \"%s\"\n",
+            i, name);
     }

     cd->major =3D major;

Then dmesg |grep CHARDEV should tell what we need to know.

Yours,
Linus Walleij

--===============0651024501666441915==--

