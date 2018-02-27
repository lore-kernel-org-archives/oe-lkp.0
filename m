Content-Type: multipart/mixed; boundary="===============7067542848728018497=="
MIME-Version: 1.0
From: Florian Fainelli <f.fainelli@gmail.com>
To: lkp@lists.01.org
Subject: Re: [net] cb0789fd8b: INFO:task_blocked_for_more_than#seconds
Date: Mon, 26 Feb 2018 20:37:25 -0800
Message-ID: <B7A9417B-A68D-4F63-A6FB-4473D6753372@gmail.com>
In-Reply-To: <20180227030234.4acgb3peinyltzmh@inn>
List-Id: <oe-lkp.lists.linux.dev>

--===============7067542848728018497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On February 26, 2018 7:02:34 PM PST, kernel test robot <fengguang.wu@inte=
l.com> wrote:
>FYI, we noticed the following commit (built with gcc-6):
>
>commit: cb0789fd8b03b59948257b67531d0b5fd87061c5 ("net: phy: Restore
>phy_resume() locking assumption")
>url:
>https://github.com/0day-ci/linux/commits/Andrew-Lunn/net-phy-Restore-phy_r=
esume-locking-assumption/20180226-220932

This was testing v1 of Andrew's patch which had a mistake leading to a dead=
lock, v2 does not have that problem.

-- =

Florian

--===============7067542848728018497==--

