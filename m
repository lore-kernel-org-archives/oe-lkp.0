Content-Type: multipart/mixed; boundary="===============0129891798059936204=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] 7d2eba0557: BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Tue, 19 Jan 2016 14:30:45 -0800
Message-ID: <alpine.DEB.2.10.1601191430110.7346@chino.kir.corp.google.com>
In-Reply-To: <20160119080211.GD2890@uranus>
List-Id: <oe-lkp.lists.linux.dev>

--===============0129891798059936204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 19 Jan 2016, Cyrill Gorcunov wrote:

> Seems it should be something like that (untested at moment, please
> take a look).
> ---
> From: Cyrill Gorcunov <gorcunov@openvz.org>
> Subject: [PATCH] mm: Fix tracepoint for scanning pages
> =

> The page might be NULL so use page_to_pfn in conditional call.
> =

> Signed-off-by: Cyrill Gorcunov <gorcunov@openvz.org>

I think this is obviously correct, so

Acked-by: David Rientjes <rientjes@google.com>

But we'd benefit from a Tested-by from the robot even more.

--===============0129891798059936204==--

