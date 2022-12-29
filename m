Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89DA1110
	for <oe-lkp@lists.linux.dev>; Thu, 29 Dec 2022 18:55:24 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id m12so6945490qvq.13
        for <oe-lkp@lists.linux.dev>; Thu, 29 Dec 2022 10:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xV2T7Ezr7Tu9usVmsoEJDL7ttiEd8vTPNlCNm/CjYXw=;
        b=Q8HGzhiP2ohA79pqC6Uy+jj5SeJtp8cWeQ++imJzVTvC0X7BH8zjPfQTyKq8UYKaK9
         1AC0vSgoFmGjyhDwqsUYuyR+M+DxG50cnO99tmHxSZf7+2kV4e7QwsWLvOtElB4S0MiR
         HyZtfODh6bFwebfqF/nLXlLMHXXZZGqY4HgxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xV2T7Ezr7Tu9usVmsoEJDL7ttiEd8vTPNlCNm/CjYXw=;
        b=2vikybhrHy3JTThoW33AkFB/FeygeaTnB7UsbcBUSSxyHALTO+SHxKuwj9FXMrjB5N
         Ti89BKKE2TkK3uMGMhsmKOFI93iXktehsY0WvH6a+vXQT/28y2vEH0vyP0lgh3EOnpgX
         j+hGLkOHck+PstQLIBKQa1aNZUnwySf51FIF8SgFzH/Y8KHryqtdiikRFXKvhijbpDJJ
         YBB3zhe+O0cF4ChuRsocvJEh/IOfQvCXqoyCxdPA4wlcnXwM7IH3qnoN9x5A2mgnZwwP
         n3F8i35aY8VTJRAH5DZey6DjAoTQoMBp/a0FFa9RW9Ka3Px+4Zbrv+hlV0ZvXDKP3FB+
         wxQA==
X-Gm-Message-State: AFqh2koPBRZtZYMcXpfPnBAKUDe58g7m3Hh44xjm1bPMC0sG+rPpOII3
	sgXAnMbHqvieud2zssIao+JbJTdZZSqFRqbE
X-Google-Smtp-Source: AMrXdXtyLLMuR1zvI2uVnF+gaO5IpVzOLiArnHEWoLSgRCkMSdYv4RRqZKhNRSAlx1fmKFbDlun/kA==
X-Received: by 2002:a05:6214:b09:b0:51e:d2cd:dd7a with SMTP id u9-20020a0562140b0900b0051ed2cddd7amr38873030qvj.16.1672340123500;
        Thu, 29 Dec 2022 10:55:23 -0800 (PST)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id x17-20020a05620a449100b006fc2e2198easm13869654qkp.95.2022.12.29.10.55.22
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 10:55:22 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id a16so15617924qtw.10
        for <oe-lkp@lists.linux.dev>; Thu, 29 Dec 2022 10:55:22 -0800 (PST)
X-Received: by 2002:ac8:67da:0:b0:3a5:122:fb79 with SMTP id
 r26-20020ac867da000000b003a50122fb79mr787348qtp.452.1672340121841; Thu, 29
 Dec 2022 10:55:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212291509.704a11c9-oliver.sang@intel.com>
In-Reply-To: <202212291509.704a11c9-oliver.sang@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 29 Dec 2022 10:55:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=wieOBgQ-7aoihBzywKqxiO7o7hc6gd_csn69ChcxR1FuQ@mail.gmail.com>
Message-ID: <CAHk-=wieOBgQ-7aoihBzywKqxiO7o7hc6gd_csn69ChcxR1FuQ@mail.gmail.com>
Subject: Re: [linus:master] [kbuild] 3bc753c06d: xfstests.generic.454.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, "Theodore Ts'o" <tytso@mit.edu>, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 29, 2022 at 12:49 AM kernel test robot
<oliver.sang@intel.com> wrote:
>
> generic/454       _check_generic_filesystem: filesystem on /dev/sda4 is inconsistent

The commentary on that test is:

  Create xattrs with multiple keys that all appear the same
  (in unicode, anyway) but point to different values.  In theory all
  Linux filesystems should allow this (filenames are a sequence of
  arbitrary bytes) even if the user implications are horrifying.

and looking at the script it seems to indeed just do setfattr and
getfattr with some unusual data (ie high bit set).

Adding Ted, since this is apparently all on ext4. I guess it could be
the vfs layer too, but it really doesn't tend to look very much at the
xattr data, so.. Adding Christian Brauner anyway, since he's been
working in this area for other reasons.

Ted, Christian - I cut down the report mercilessly. It's not really
all that interesting, apart from the basic information of "xfstest
generic/454 started failing consistently on ext4 at commit
3bc753c06dd0 ('kbuild: treat char as always unsigned')".

If you think you need more, see

    https://lore.kernel.org/all/202212291509.704a11c9-oliver.sang@intel.com/

Also, I'm surprised this hasn't been an issue earlier - 'char' has
always been unsigned on arm (among other architectures), so if this
test started failing now on x86-64 due to -funsigned-char, it has
presumably been failing on arm the whole time.

I assume it's something that compares a 'char *name' by value, but the
ones I looked at (eg xattr_find_entry() used strlen()/memcmp() which
should be all good).

Oh, I think I see one potential problem in ext4:

ext4_xattr_hash_entry() is hot garbage. Lookie here:

        while (name_len--) {
                hash = (hash << NAME_HASH_SHIFT) ^
                       (hash >> (8*sizeof(hash) - NAME_HASH_SHIFT)) ^
                       *name++;
        }

so that hash will now depend on the sign of that 'char *name' pointer.

If that hash ever has any long-term meaning (ie saved on disk or
exposed some other way), that would be problematic.

Of course, if it's just an ephemeral thing only used on that one
machine, then it isn't a problem - having different hashes on
different machines (and different boots) is a non-issue. But
considering that it then does

        return cpu_to_le32(hash);

at the end does seem to imply to me that it all really *tries* to be
architecture-neutral, and has just failed horrendously.

Because that does look like code that might get confused by the sign of a char.

There might be other cases, I only looked very quickly for these kinds
of problems.

          Linus
