Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5623A9605
	for <oe-lkp@lists.linux.dev>; Tue,  8 Sep 2026 08:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854890; cv=pass; b=sVQhJUfZRt76vYiXqugnonBMGoChpXbq3TPSpP4uoIKEJV/1uzOxgCROYNfgcwX+5yTF2kBQI6nqXBRvfdtqsDJGywwV7S+ZkF/7eDGOlFmo2/2jY8WIpSk3uB7ty6HQrueSm/YUPQtZZU4VPa7tB8ntY6qH7KCc/kBsGYQlXSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854890; c=relaxed/simple;
	bh=tXGbdgcqzz4CAJeru5w2V89eLrYgFnhR0h4hmZG/qUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JRgdF31uBhabJbHorUiTO+ttIkDHc/sm6yyCvg6UGZAUoClaFbS8F7KNLDnZHlzkD63/W5/QOQR8yhcDXSrfxOqsJn9YdtH+Rp6oawWAxLmEAXlrce7pk6vumjXC6JHRJQULPGXeuiT2udI+O+sANsmqCeOKhOJR+hf8aHtw5Yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ix05KW9c; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ix05KW9c"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c250a2bc3b3so494046166b.2
        for <oe-lkp@lists.linux.dev>; Tue, 08 Sep 2026 01:08:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788854887; cv=none;
        d=google.com; s=arc-20260327;
        b=rC0oqcGOWP6f0fCyj5W3tgZOMnzNotGhAoulmAuiF+D94tErkijHSdz/MfJFi3XYgw
         ihp1rqgsY/LPSI/afnREQDcxskJCHHV0eANhsRb1JbmSBefxIeNPObInB69G78CU30R3
         705ahNEr7/ue7VPKXtsrBOyx7R03Fl55CIbvgLTIqkwjqteNK/0eVXXWpCVkCAF8pdQk
         ePzwXCuI54A8iBT2/eYKNhV65E/c77G4ImDoieUQCyEnA/pddwuqDapGQSfUiVhVbLAI
         aHtjuPG3jVH3iskLxx0Y5M5/6Cvdr4B5hQlCEZ7JAhvmrbjhBdlKZk3U+eoRa1KjoWYm
         Jn9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sa6upqADQlqR/MmaNL6A6E6rZ+XVW/lKGKReqxKXRig=;
        fh=v1Twxu7hBIYhhPx07njVrlBcpvMY3tvcyXy6jMwttNo=;
        b=iPgF5BNBeEzrL3EcwWhqvERZ/PS1bNNDM49VGM+FFw01OK0oYPAvb8yIr6eGbeGmGM
         0/ODKPCffgxOMYB95asirFQOEgvclF+/beHaNg4zRkfjKGvLJGNc/tRjF+bC+lluYULt
         fTNC53LFtbu1lpJyfqIfcwjRQojEWtQjM9C8DL2aZYvlazWIFXBIZk2aaaWhTa5zzx/s
         o/e7ccPp5pcZWt3ujKKgFK5EFCH49/VFG2Qaaq6nl3/J+SJrS10yU343eu9/w6rwTs6k
         uAbT5/v8KrQJMeK1XZMSSTQxxZo4mimzTEYNWkcisU/yeleOjmhw/OSAQt6wm1GEH190
         CXiA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788854887; x=1789459687; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sa6upqADQlqR/MmaNL6A6E6rZ+XVW/lKGKReqxKXRig=;
        b=Ix05KW9ckQMjxE9Ip25Ss77itHyms+Le/GW1OX/7gF2G/ku5/2SW1z2mYONMAuy7DI
         90lHWD2FugTLgE4/yrNMO+Oo5a7j6wckIrqvUF/r14v92P5X8D5Vi/zqHyzo1r7GFRoX
         uLi6nBmsKr8Mx0uV4gzOLpsuuEcwLhW0wJk77QcIHhsF7CQRP1CUqMqAvIuacGhxgarO
         jW+fzXHdQ8GrCiVJ172m3U1I8F66p395j4j4VgUmyxP+/VzGmYS+o6qPuJ7+/Vn1XonN
         Jc6KJbFTjGlc06FJIxlPOKvFR+UGLQE+ytjanmXB6PhnyX1wAe6AnveO5BjExXYH5ITc
         TP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788854887; x=1789459687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sa6upqADQlqR/MmaNL6A6E6rZ+XVW/lKGKReqxKXRig=;
        b=ewwJX5KG66ql0ksQ8CzH30qR/KmDuPMCuGJEQHWYUl0F/+Jqp7BBbnpvvGDT5sBZ59
         6JttHM+uo5Xo3KYR9LIosyqUy/hdv4rkFMt8kPnUprlfT/AN37HTHvrsIB3p6mNMqXmW
         M2XtIGagStju9KD0J5IxF4ytYWbk5v1oK7MPaUOTmO5albnDOzUivhU28hsgD5JHtuR3
         NsWADJd4Y/lyqDi9ZnGli37K3rm5hQGrsUi2st9G+BlZrf+1b3+oJON0qOrYVPwrFxNq
         NLeqYh/7sF3PwXmZXBvLhFV+21SnuekQXUB0rnXubfx3spx22oX9DAGItjravQokQuc4
         a5+g==
X-Forwarded-Encrypted: i=1; AKwUvBwq8OphkkmOgABEZNKx7DITLuJk4ggJuY+/GNfaBQzx6g8OVoWBhJ6alK/m135zi6Ud2e4kq3U=@lists.linux.dev
X-Gm-Message-State: AFuF++kjQO12+c8Sw/JfQTPV25sqVsxtLcPLdKeisytDdFuzlhaf+GPc
	fUoNI10DHqDzTHTOj3MymeNDr/dkgaPRVCSz20Uxgu+TvW3lpyZnYN2xJ6WxZbazFGduNx+7wTl
	enQZq9YyX5V3te1/1UXKK9l6uU1JdXXU=
X-Gm-Gg: AYBFou32oCVp42vnBkdeskj2ublcVwTrZy4bb0DUALKymP1gp4G+YiC1K3LiogxLs2b
	XLKwUyxZAwo9p8KtRzRGluZ3y3C/R7F9X4Lb7doa/8+pCVTDpIk0YGQQsdyerYcvZGsbAqJuDyU
	2ETj4wNxH/I9fA3ikahAorSMyyHGuXKs5dWmT1nqb6oxaQKJtu/tbuRm+ed3UtITY7A2Nm9NPA0
	c7vHX26FElOxD6z72o3Tgl4xb6ZNBvDn6wkKHXYNbBomJOM29vIESwrpamXVc/CDXHDDJ877MEZ
	+6hrbOFbjV3N0NnbBHs31GXtLTqZMAHKv6wHICJE+iWTLimwphF4KtuG1zlv6MwlJfQzaD6VTbK
	kBqhkmdtsxA==
X-Received: by 2002:a17:906:8d89:b0:c24:c250:a6b5 with SMTP id
 a640c23a62f3a-c260c993a9amr1051714266b.12.1788854886462; Tue, 08 Sep 2026
 01:08:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9fbb6bf2-70ae-4d49-9221-751d28dcfd1a@redhat.com>
 <o6cnjqy4ivjqaj4n5xphstfnk5jznufaygwmfkm2gyixqgfump@7fc6c6h6d5if> <28f144f8-431d-4c3a-a362-56083bb77541@redhat.com>
In-Reply-To: <28f144f8-431d-4c3a-a362-56083bb77541@redhat.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 8 Sep 2026 10:07:53 +0200
X-Gm-Features: AcwNN1V1vd5mVM1XveYVMiH3ACcL2s2pHzLcWY3GJUvl9XLSZ31SO_QV5_aeSjk
Message-ID: <CAGudoHFJne0q+dnjYdXOyDKEfu_zZ71_z+kSiUPiHWG7jCBw-Q@mail.gmail.com>
Subject: Re: [PATCH RFC] fs: cache-align lock_class_keys in struct file_system_type
To: Eric Sandeen <sandeen@redhat.com>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, David Howells <dhowells@redhat.com>, lkp@intel.com, 
	oe-lkp@lists.linux.dev, Alexander Viro <aviro@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

While I'm not convinced spending time on the resulting bug is
worthwhile, with the arrival of sashiko I think you should rebase &
resend -- it very well might just point out the problem with 0 human
effort.

On Tue, Dec 30, 2025 at 11:45=E2=80=AFPM Eric Sandeen <sandeen@redhat.com> =
wrote:
>
> On 12/30/25 4:04 PM, Mateusz Guzik wrote:
> > On Tue, Dec 30, 2025 at 03:07:10PM -0600, Eric Sandeen wrote:
> >> LKP reported that one of their tests was failing to even boot with my
> >> "old mount API code" removal patch. The test was booting an i386 kerne=
l
> >> under QEMU, with lockdep enabled. Rather than a functional failure, it
> >> seemed to have been slowed to a crawl and eventually timed out.
> >>
> >> I narrowed the problem down to the removal of the ->mount op from
> >> file_system_type, which changed structure alignment and seems to have
> >> caused cacheline issues with this structure. Annotating the alignment
> >> fixes the problem for me.
> >>
> >> Reported-by: kernel test robot <oliver.sang@intel.com>
> >> Closes: https://lore.kernel.org/oe-lkp/202512230315.1717476b-lkp@intel=
.com
> >> Fixes: 51a146e05 ("fs: Remove internal old mount API code")
> >> Signed-off-by: Eric Sandeen <sandeen@redhat.com>
> >> ---
> >>
> >> RFC because I honestly don't understand why this should be so critical=
,
> >> especially the structure was not explicitly (or even very well) aligne=
d
> >> before. I would welcome insights from folks who are smarter than me!
> >>
> >> diff --git a/include/linux/fs.h b/include/linux/fs.h
> >> index 9949d253e5aa..b3d8cad15de1 100644
> >> --- a/include/linux/fs.h
> >> +++ b/include/linux/fs.h
> >> @@ -2279,7 +2279,7 @@ struct file_system_type {
> >>      struct file_system_type * next;
> >>      struct hlist_head fs_supers;
> >>
> >> -    struct lock_class_key s_lock_key;
> >> +    struct lock_class_key s_lock_key ____cacheline_aligned;
> >>      struct lock_class_key s_umount_key;
> >>      struct lock_class_key s_vfs_rename_key;
> >>      struct lock_class_key s_writers_key[SB_FREEZE_LEVELS];
> >>
> >
> > There is no way is about cacheline bouncing. According to the linked
> > thread the test vm has only 2 vcpus:
> >> test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
4G
> >
> > Even if the vcpu count was in hundreds and the ping pong was a problem =
it
> > still would not have prevented bootup.
>
> Fair enough, it really didn't make sense to me.
>
> > Instead something depends on the old layout for correctness.
>
> If I add ->mount back to the /end/ of the structure, it boots fine again,
> so I guess nothing is expecting specific offsets within the structure
> at least.
>
> (If I turn off lockdep in the kernel config, it boots fine again too,
> FWIW.)
>
> > By any chance is this type-punned somewhere?
>
> I don't think so...
>
> > While I can't be bothered to investigate, I *suspect* the way to catch
> > this would patch out all of the lock_class_key vars & uses and boot wit=
h
> > KMSAN (or was it KASAN?). Or whatever mechanism which can tell the
> > access is oob.
>
> Can't do KASAN or KMSAN on i386, AFAIK. :(
>
> I suppose I could try such things on x86_64 just in case something shows
> up...
>
> Thanks!
>
> -Eric
>
