Content-Type: multipart/mixed; boundary="===============5055137460314685427=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] selftests/ir: fix build with ancient kernel headers
Date: Tue, 01 Feb 2022 16:58:48 +0000
Message-ID: <YflmyHrYg1xJlW0u@casper.infradead.org>
In-Reply-To: <YflldzHZPVK3OQRJ@gofer.mess.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5055137460314685427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 01, 2022 at 04:53:11PM +0000, Sean Young wrote:
> +/* Support ancient lirc.h which does not have these values */

Can we have a little more information here, such as "Can be removed once
RHEL 8 is no longer a relevant testing platform"?  That will save people
doing archaology to find out when it's safe to remove.

--===============5055137460314685427==--

