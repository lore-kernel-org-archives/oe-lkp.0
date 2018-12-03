Content-Type: multipart/mixed; boundary="===============8570347319627538751=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Mon, 03 Dec 2018 10:19:55 -0800
Message-ID: <CAHk-=whrfDw4yV4h2ijbX3vpXf5m4hzJ5pGX7_v6pU31RGib-g@mail.gmail.com>
In-Reply-To: <20181203181456.GK31738@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============8570347319627538751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 3, 2018 at 10:15 AM Michal Hocko <mhocko@kernel.org> wrote:
>
> The thing is that there is no universal win here. There are two
> different types of workloads and we cannot satisfy both.

Ok, if that's the case, then I'll just revert the commit.

Michal, our rules are very simple: we don't generate regressions. It's
better to have old reliable behavior than to start creating *new*
problems.

                 Linus

--===============8570347319627538751==--

