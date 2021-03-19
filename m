Content-Type: multipart/mixed; boundary="===============2476816432650947446=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [seq_file] 5fd6060e50: stress-ng.eventfd.ops_per_sec -49.1% regression
Date: Fri, 19 Mar 2021 12:31:57 -0700
Message-ID: <202103191230.5054A14247@keescook>
In-Reply-To: <20210319140742.GC30349@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2476816432650947446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2021 at 10:07:42PM +0800, kernel test robot wrote:
> FYI, we noticed a -49.1% regression of stress-ng.eventfd.ops_per_sec due =
to commit:

Well, so it can be seen. ;) Though I feel slightly better that it's stress-=
ng
instead of a "normal" workload.

Thanks for the report!

-- =

Kees Cook
--===============2476816432650947446==--

