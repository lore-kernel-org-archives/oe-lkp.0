Content-Type: multipart/mixed; boundary="===============7752889701550406636=="
MIME-Version: 1.0
From: David Vrabel <david.vrabel@citrix.com>
To: lkp@lists.01.org
Subject: Re: [mm/vmalloc] BUG: sleeping function called from invalid context at mm/vmalloc.c:74
Date: Wed, 19 Mar 2014 11:57:58 +0000
Message-ID: <53298646.4080404@citrix.com>
In-Reply-To: <20140319115540.GA7277@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============7752889701550406636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 19/03/14 11:55, Fengguang Wu wrote:
> Hi David,
> =

> FYI, we noticed the below BUG on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 032dda8b6c4021d4be63bcc483b47fd26c6f48a2 ("mm/vmalloc: avoid soft =
lockup warnings when vunmap()'ing large ranges")

Thanks,  this patches have been are in the process of being dropped.

David

--===============7752889701550406636==--

