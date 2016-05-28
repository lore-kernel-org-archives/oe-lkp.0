Content-Type: multipart/mixed; boundary="===============3357881039881845824=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] Revert "i2c: dev: switch from register_chrdev to cdev API"
Date: Sat, 28 May 2016 12:15:59 +0300
Message-ID: <20160528091559.GR11011@mwanda>
In-Reply-To: <1464426467-1824-1-git-send-email-wsa@the-dreams.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============3357881039881845824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 28, 2016 at 11:07:47AM +0200, Wolfram Sang wrote:
> This reverts commit d6760b14d4a1243f918d983bba1e35c5a5cd5a6d. When
> hitting Linus' tree, buildbots ran additional checks and found boot
> problems. Although Dan Carpenter provided an obvious fix already, I
> still could not reproduce one problem manually (at least not on a
> Saturday morning). So we'll try again later after some more
> investigation.
> =


These kinds of use after frees don't always cause a runtime problem.  I
found it using static analysis, but I bet you could detect it if you
enabled kasan.  The other option is to enable PAGE_POISONING?

regards,
dan carpenter


--===============3357881039881845824==--

