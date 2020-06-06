Content-Type: multipart/mixed; boundary="===============4986881535955080449=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [kernfs] ea7c5fc39a: stress-ng.stream.ops_per_sec 11827.2% improvement
Date: Sat, 06 Jun 2020 20:18:02 +0200
Message-ID: <20200606181802.GA15638@kroah.com>
In-Reply-To: <20200606155216.GU12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4986881535955080449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 06, 2020 at 11:52:16PM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a 11827.2% improvement of stress-ng.stream.ops_per_sec du=
e to commit:
> =

> =

> commit: ea7c5fc39ab005b501e0c7666c29db36321e4f74 ("[PATCH 1/4] kernfs: sw=
itch kernfs to use an rwsem")
> url: https://github.com/0day-ci/linux/commits/Ian-Kent/kernfs-proposed-lo=
cking-and-concurrency-improvement/20200525-134849
> =


Seriously?  That's a huge performance increase, and one that feels
really odd.  Why would a stress-ng test be touching sysfs?

thanks,

greg k-h
--===============4986881535955080449==--

