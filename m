Content-Type: multipart/mixed; boundary="===============4936982169136314405=="
MIME-Version: 1.0
From: David Sterba <dsterba@suse.cz>
To: lkp@lists.01.org
Subject: Re: [btrfs] cc8385b59e: BUG:sleeping_function_called_from_invalid_context_at_mm/slab.h
Date: Thu, 11 May 2017 10:43:41 +0200
Message-ID: <20170511084341.GD27439@suse.cz>
In-Reply-To: <20170508205048.GA101014@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4936982169136314405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2017 at 04:50:48AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: cc8385b59e17d489814d54d6a846aba7051fdea5 ("btrfs: preallocate rad=
ix tree node for readahead")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

For the record, that's a known one and has been fixed, there were some
for-next branches without the fix.

--===============4936982169136314405==--

